state ("VHOLUME-Win64-Shipping")
{
    double IGT : 0x0858E700, 0x28, 0x28, 0x148, 0x50;
    string50 level : 0x0837B0B5;
}

start
{
    if (current.IGT > 0 && current.level == "racetrack") return true;
}

reset
{
    if (current.IGT < old.IGT && current.level == "racetrack") return true;
}

split
{
    if (current.level != old.level) return true;
}

update
{
    timer.SetGameTime(TimeSpan.FromSeconds(current.IGT));
    timer.IsGameTimePaused = current.IGT == old.IGT;
}
