class Panel : ToolPanel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.IconList : share IconList;

        this.Command : this.ListInfra.ArrayCreate(14);
        this.ArrayIndex : 0;

        this.AddCommand(this.IconList.ToolNew);
        this.AddCommand(this.IconList.Save);
        this.AddCommand(this.IconList.SaveAll);
        this.AddCommand(this.IconList.Undo);
        this.AddCommand(this.IconList.Redo);
        this.AddCommand(this.IconList.Execute);
        this.AddCommand(this.IconList.PackageNew);
        this.AddCommand(this.IconList.ClassNew);
        this.AddCommand(this.IconList.OpenClass);
        this.AddCommand(this.IconList.Find);
        this.AddCommand(this.IconList.LabelNext);
        this.AddCommand(this.IconList.LabelPrev);
        this.AddCommand(this.IconList.Back);
        this.AddCommand(this.IconList.Front);

        this.Set();

        return true;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate IconList IconList { get { return data; } set { data : value; } }
    field precate Int ArrayIndex { get { return data; } set { data : value; } }

    maide precate Bool AddCommand(var Icon icon)
    {
        var Command a;
        a : new Command;
        a.Icon : icon;
        a.Init();

        this.Command.Set(this.ArrayIndex, a);
        this.ArrayIndex : this.ArrayIndex + 1;
        return true;
    }
}