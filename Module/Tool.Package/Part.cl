class Part : ToolPart
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Name : "Package";
        this.Icon : this.IconList.Package;
        return true;
    }
}