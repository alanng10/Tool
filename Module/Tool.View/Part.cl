class Part : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ToolViewInfra : share Infra;
        this.IconList : share IconList;
        return true;
    }

    field prusate String Name { get { return data; } set { data : value; } }
    field prusate Icon Icon { get { return data; } set { data : value; } }
    field prusate Panel Panel { get { return data; } set { data : value; } }
    field precate Infra ToolViewInfra { get { return data; } set { data : value; } }
    field precate IconList IconList { get { return data; } set { data : value; } }
}