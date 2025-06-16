class Part : ToolPart
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Name : "Find";
        this.Icon : this.IconList.Find;
        return true;
    }
}