class Part : ToolPart
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Name : "Problem";
        this.Icon : this.IconList.Problem;
        return true;
    }
}