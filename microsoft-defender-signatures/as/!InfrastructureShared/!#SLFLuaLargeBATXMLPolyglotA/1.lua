-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:LargeBATXMLPolyglot.A
-- Type: 13
-- MpAttributes: BM_SCRIPT_OR_TEXT_FILE & LUA:FileSizeGT1M.A & SCPT:BATEnableDelayedExpansion.C1 & SCRIPT:HtmlCommentTag

if mp.readu_u32(headerpage, 1) == 757932348 and mp.readu_u32(footerpage, mp.FOOTERPAGE_SZ - 3) == 1043148042 then
  return mp.INFECTED
end
return mp.CLEAN
