-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\554_luac 

-- params : ...
-- function num : 0
if peattributes.isexe == false or peattributes.no_imports == true then
  return mp.CLEAN
end
if (pe.query_import)(pe.IMPORT_STATIC, 4277576571) ~= 0 or (pe.query_import)(pe.IMPORT_STATIC, 4277576570) ~= 0 then
  local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = ((MpCommon.PathToWin32Path)(l_0_1)):lower()
  if (string.match)(l_0_2, "\\program files") or (string.match)(l_0_2, "\\windows") then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2 .. "\\" .. l_0_0
  ;
  (mp.set_mpattribute)("MpInternal_researchdata=cabParentPath=" .. l_0_3)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

