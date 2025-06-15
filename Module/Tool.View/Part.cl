class Part : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ToolViewInfra : share ToolViewInfra;
        return true;
    }

    field prusate String Name { get { return data; } set { data : value; } }
    field prusate Icon Icon { get { return data; } set { data : value; } }
    field prusate View Tool { get { return data; } set { data : value; } }
    field precate Infra ToolViewInfra { get { return data; } set { data : value; } }
}