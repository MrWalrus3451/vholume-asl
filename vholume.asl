state ("VHOLUME-Win64-Shipping")
{
    double IGT : 0x08231C90, 0xA8, 0x28, 0x138, 0x80;
    string50 level : 0x08386035;
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
