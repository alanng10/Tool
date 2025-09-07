class Part : ToolPart
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Name : "Struct";
        this.Icon : this.IconList.Struct;
        return true;
    }
}