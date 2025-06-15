namespace Z.Tool.Tool.IconList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Tool.Icon");
        this.ClassName = this.S("IconList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("Icon");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.S("ToolData/Tool/ItemListIcon.txt");
        this.AddMethodFileName = this.S("ToolData/Tool/AddMaideIcon.txt");
        this.OutputFilePath = this.S("../../Module/Tool.Icon/IconList.cl");
        return true;
    }
}