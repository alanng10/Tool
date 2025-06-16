class Part : ToolPart
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Name : "Package Park Tool";
        this.Icon : this.IconList.Package;
        return true;
    }
}