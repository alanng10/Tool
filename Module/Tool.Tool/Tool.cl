class Tool : Any
{
    maide prusate Bool Init()
    {
        return true;
    }

    maide prusate Bool Load()
    {
        if (~share ToolViewInfra.Load())
        {
            return false;
        }

        return true;
    }

    maide prusate Bool Execute()
    {
        var PackagePart packagePart;
        packagePart : new PackagePart;
        packagePart.Init();

        var Array array;
        array : this.ListInfra.ArrayCreate(1);

        array.Set(0, packagePart);

        var Table table;
        table : new Table;
        table.Init();
        table.Part : array;
        table.Index : 0;
        table.Pos.Col : 100;
        table.Pos.Row : 100;
        table.Size.Wed : 500;
        table.Size.Het : 300;

        var Frame frame;
        frame : new Frame;
        frame.Init();

        frame.View : table;

        var ThreadThis threadThis;
        threadThis : new ThreadThis;
        threadThis.Init();

        threadThis.ExecuteMain();

        frame.Final();
        return true;
    }
}