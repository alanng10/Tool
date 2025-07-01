class Panel : ToolPanel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.IconList : share IconList;

        var List list;
        list : new List;
        list.Init();

        list.Add(this.CreateCommand(this.IconList.ToolNew));
        list.Add(this.CreateCommand(this.IconList.Save));
        list.Add(this.CreateCommand(this.IconList.SaveAll));
        list.Add(this.CreateCommand(this.IconList.Undo));
        list.Add(this.CreateCommand(this.IconList.Redo));
        list.Add(this.CreateCommand(this.IconList.Execute));
        list.Add(this.CreateCommand(this.IconList.PackageNew));
        list.Add(this.CreateCommand(this.IconList.ClassNew));
        list.Add(this.CreateCommand(this.IconList.OpenClass));
        list.Add(this.CreateCommand(this.IconList.Find));
        list.Add(this.CreateCommand(this.IconList.LabelNext));
        list.Add(this.CreateCommand(this.IconList.LabelPrev));
        list.Add(this.CreateCommand(this.IconList.Prev));
        list.Add(this.CreateCommand(this.IconList.Next));

        this.Command : this.ListInfra.ArrayCreateList(list);

        this.Set();

        return true;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate IconList IconList { get { return data; } set { data : value; } }

    maide precate Command CreateCommand(var Icon icon)
    {
        var Command a;
        a : new Command;
        a.Icon : icon;
        a.Init();
        return a;
    }
}