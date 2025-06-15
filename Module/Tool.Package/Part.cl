class Part : ToolPart
{
    maide prusate Bool Init()
    {
        base.Init();
        this.IconList : share IconList;
        this.Name : "Package";
        this.Icon : this.IconList.IconPackageList;
        return true;
    }

    field prusate String Name { get { return data; } set { data : value; } }
    field prusate Icon Icon { get { return data; } set { data : value; } }
    field prusate View Tool { get { return data; } set { data : value; } }
    field precate IconList IconList { get { return data; } set { data : value; } }
}