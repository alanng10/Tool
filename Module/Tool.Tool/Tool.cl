class Tool : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ViewInfra : share ViewInfra;
        return true;
    }

    field prusate Frame Frame { get { return data; } set { data : value; } }
    field prusate ThreadThis ThreadThis { get { return data; } set { data : value; } }
    field prusate Table Table { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ViewInfra ViewInfra { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        inf (~share IconInfra.Load())
        {
            return false;
        }

        inf (~share ToolViewInfra.Load())
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

        var ProblemPart problemPart;
        problemPart : new ProblemPart;
        problemPart.Init();

        var DocuePart docuePart;
        docuePart : new DocuePart;
        docuePart.Init();

        var FindPart findPart;
        findPart : new FindPart;
        findPart.Init();

        var TerminaPart terminaPart;
        terminaPart : new TerminaPart;
        terminaPart.Init();

        var List list;
        list : new List;
        list.Init();

        list.Add(packagePart);
        list.Add(problemPart);
        list.Add(docuePart);
        list.Add(findPart);
        list.Add(terminaPart);

        var Array array;
        array : this.ListInfra.ArrayCreateList(list);

        this.Table : new Table;
        this.Table.Palete : this.ViewInfra.PaleteDefault;
        this.Table.Init();
        this.Table.Part : array;
        this.Table.Index : 0;
        this.Table.Pos.Col : 0;
        this.Table.Pos.Row : 0;
        this.Table.Size.Wed : 1000;
        this.Table.Size.Het : 300;

        var Grid grid;
        grid : new Grid;
        grid.Init();
        grid.Pos.Col : 100;
        grid.Pos.Row : 50;
        grid.Size.Wed : 1000;
        grid.Size.Het : 600;

        var Count colA;
        colA : new Count;
        colA.Init();
        colA.Value: 1000;

        var Count rowA;
        rowA : new Count;
        rowA.Init();
        rowA.Value: 50;

        var Count rowB;
        rowB : new Count;
        rowB.Init();
        rowB.Value: 100;

        grid.Col.Add(colA);
        grid.Row.Add(rowA);
        grid.Row.Add(rowB);

        var Panel panel;
        panel : new Panel;
        panel.Palete : this.ViewInfra.PaleteDefault;
        panel.Init();
        panel.Pos.Col : 0;
        panel.Pos.Row : 0;

        var GridChild childA;
        childA : new GridChild;
        childA.Init();
        childA.Rect.Pos.Col : 0;
        childA.Rect.Pos.Row : 0;
        childA.Rect.Size.Wed : 1;
        childA.Rect.Size.Het : 1;
        childA.View : panel;

        var GridChild childB;
        childB : new GridChild;
        childB.Init();
        childB.Rect.Pos.Col : 0;
        childB.Rect.Pos.Row : 1;
        childB.Rect.Size.Wed : 1;
        childB.Rect.Size.Het : 1;
        childB.View : this.Table;

        grid.ChildList.Add(childA);
        grid.ChildList.Add(childB);

        this.ThreadThis : new ThreadThis;
        this.ThreadThis.Init();

        var Type type;
        type : new Type;
        type.Init();
        type.Tool : this;

        this.Frame : new Frame;
        this.Frame.Init();

        this.Frame.Type : type;

        this.Frame.View : grid;

        this.Frame.Shown : true;

        this.ThreadThis.Thread.ExecuteMain();

        this.Frame.Final();
        return true;
    }
}