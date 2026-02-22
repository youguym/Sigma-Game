ysp += 0.1;
ysp = clamp(ysp, -10, 5);


var move_speed = 2.5;
xsp = 0;

if (keyboard_check(vk_left))
{
    xsp = -move_speed;
}

if (keyboard_check(vk_right))
{
    xsp = move_speed;
}

if (place_meeting(x, y + 1, oSpawn) || place_meeting(x, y + 1, oSpatula))
{
    if (keyboard_check_pressed(vk_up))
    {
        ysp = -2.5;  
    }
}


if (!place_meeting(x + xsp, y, oSpawn) 
&& !place_meeting(x + xsp, y, oSpatula))
{
    x += xsp;
}
else
{
    while (!place_meeting(x + sign(xsp), y, oSpawn) 
    && !place_meeting(x + sign(xsp), y, oSpatula))
    {
        x += sign(xsp);
    }
    xsp = 0;
}


if (!place_meeting(x, y + ysp, oSpawn) 
&& !place_meeting(x, y + ysp, oSpatula))
{
    y += ysp;
}
else
{
    while (!place_meeting(x, y + sign(ysp), oSpawn) 
    && !place_meeting(x, y + sign(ysp), oSpatula))
    {
        y += sign(ysp);
    }
    ysp = 0;
}


if (place_meeting(x, y, oFlag))
{
    room_goto_next();
}


if (place_meeting(x, y, oHook))
{
    room_restart();
}


if (y > room_height)
{
    room_restart();
}