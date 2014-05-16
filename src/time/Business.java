package time;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class Business implements Job {

	public void perform() {
		
	}

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		perform();
	}

	
}
