state ("VHOLUME-Win64-Shipping") //Taken from Toyro's Chapter Autosplitter
{
    double IGT : 0x08671C68, 0xA0, 0x18, 0x138, 0x80; //0x08371AE8
    string50 level : 0x08374B15;
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