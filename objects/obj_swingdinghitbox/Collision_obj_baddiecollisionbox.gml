with (other.id)
{
    if (baddieID.state != states.grabbed)
    {
        instance_destroy()
        instance_destroy(baddieID)
    }
}
