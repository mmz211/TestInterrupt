

configuration TestIntAppC {}
implementation 
{
	components TestIntC as App;

	components MainC, LedsC, new TimerMilliC() as TimerMilliC, NoLedsC;
	App.Boot -> MainC.Boot;
	App.Leds -> LedsC;
	App.TaskTimer -> TimerMilliC;

	components HplAtm128InterruptC as InterruptC;
	App.Interrupt -> InterruptC.Int4;
}
