

module TestIntC @safe() 
{
	uses 
	{
		interface Boot;
		interface Leds;
		interface Timer<TMilli> as TaskTimer;

		interface HplAtm128Interrupt as Interrupt;
	}
}
implementation 
{

	event void Boot.booted() 
	{
call Leds.led2Toggle();
		call Interrupt.edge(FALSE); 
		//TRUE if the interrupt should be triggered on a low to high edge transition, false for interrupts on a high to low transition
		call Interrupt.enable();

		call TaskTimer.startPeriodic(3000);
	}

	event void TaskTimer.fired() 
	{
call Leds.led1Toggle();
	}

	async event void Interrupt.fired()
	{
call Leds.led0Toggle();
	}
}

