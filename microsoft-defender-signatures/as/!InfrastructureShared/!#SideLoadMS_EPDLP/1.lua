-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SideLoadMS_EPDLP\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_LOWERCASE, mp.FILEPATH_QUERY_CNAME))
if not l_0_0 or not #l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("LUA:PeFileVersion")
if not l_0_1 or not #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (l_0_1[1]):match("!([%d.]+)")
if l_0_2 == "4.18.25110.5" then
  local l_0_3 = (mp.getfilesize)()
  if not l_0_3 or l_0_3 < 1500000 then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  local l_0_4 = (mp.readfile)(358304, 2)
  ;
  (mp.readprotection)(true)
  if l_0_4 == "H\131" then
    (mp.ReportLowfi)(l_0_0, 3957269496)
  else
    ;
    (mp.ReportLowfi)(l_0_0, 1926656578)
  end
end
do
  return mp.CLEAN
end

