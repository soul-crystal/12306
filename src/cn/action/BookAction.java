package cn.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.bean.Contact;
import cn.bean.SeatType;
import cn.bean.TicketNum;
import cn.bean.TicketPrice;
import cn.bean.Train;
import cn.bean.TrainNum;
import cn.bean.User;
import cn.dao.ContactDao;
import cn.dao.SeatTypeDao;
import cn.dao.StationDao;
import cn.dao.TicketNumDao;
import cn.dao.TicketPriceDao;
import cn.dao.TrainDao;
import cn.dao.TrainNumDao;
import cn.dao.impl.ContactDaoImpl;
import cn.dao.impl.SeatTypeDaoImpl;
import cn.dao.impl.StationDaoImpl;
import cn.dao.impl.TicketNumDaoImpl;
import cn.dao.impl.TicketPriceDaoImpl;
import cn.dao.impl.TrainDaoImpl;
import cn.dao.impl.TrainNumDaoImpl;
import cn.framework.Action;
import cn.util.Contract;
import cn.util.Trainnum;
import net.sf.json.JSONArray;

public class BookAction implements Action
{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
	{
		TrainDao td = new TrainDaoImpl();
		TicketNumDao trd = new TicketNumDaoImpl();
		StationDao sd = new StationDaoImpl();
		TicketPriceDao tpd = new TicketPriceDaoImpl();
		SeatTypeDao std = new SeatTypeDaoImpl();
		TrainNumDao tnd = new TrainNumDaoImpl();
		Map<String, Double> seatprice = new HashMap<String, Double>();
		int id = Integer.valueOf(request.getParameter("id"));
		String startstation = request.getParameter("startstation");
		String endstation = request.getParameter("endstation");
		TrainNum tnu = tnd.fingTrainNum(id);
		Date date = tnu.getDatetime();
		Train train = td.findTrainById(id);
		String trainname = train.getName();
		List<Trainnum> lt = tnd.findTrainnum(startstation, endstation, date);
		Trainnum tn = new Trainnum();
		for (Trainnum tr : lt)
		{
			if (tr.getName().equals(trainname))
			{
				tn = tr;
				break;
			}
		}
		int tid = td.findTrainByName(trainname).getId();
		List<TicketNum> ltn = trd.findTicketNumByTrainnumid(tid);
		int sid = sd.findStationByName(startstation).getId();
		int eid = sd.findStationByName(endstation).getId();
		List<TicketPrice> price = tpd.findPriceByStationId(sid, eid);
		for (TicketNum t : ltn)
		{
			SeatType s = std.findSeatTypeById(t.getSeattypeid());
			for (TicketPrice tp : price)
			{
				if (tp.getSeattypeid() == t.getSeattypeid())
					seatprice.put(s.getName(), tp.getPrice());
			}
		}

		User u = (User) request.getSession().getAttribute("user");
		ContactDao cd = new ContactDaoImpl();

		List<Contact> lc = cd.findcontactByUserId(u.getId());
		List<Contract> contract = new ArrayList<Contract>();
		for (Contact c : lc)
		{
			Contract con = new Contract(c.getName(), c.getIdcardnum(), c.getPhonenum(), c.getIdtypeid(),
					c.getTouristtypeid());
			contract.add(con);
		}
		JSONArray json = JSONArray.fromObject(contract);
		request.setAttribute("train", trainname);
		request.setAttribute("date", date);
		request.setAttribute("startstation", startstation);
		request.setAttribute("endstation", endstation);
		request.setAttribute("contact", json);
		request.setAttribute("seat", tn);
		request.setAttribute("seatprice", seatprice);
		return "reserve.jsp";
	}

}
