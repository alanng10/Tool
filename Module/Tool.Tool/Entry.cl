class Entry : EntryEntry
{
    maide precate Int ExecuteMain()
    {
        var Tool tool;
        tool : new Tool;
        tool.Init();
        tool.Load();
        tool.Execute();
        return 0;
    }
}