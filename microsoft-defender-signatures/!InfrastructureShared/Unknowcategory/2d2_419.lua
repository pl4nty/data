-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\2d2_419.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if #l_0_0 == 64 then
  return mp.CLEAN
end
local l_0_1 = "qnetd"
local l_0_2 = "agtty(.-)%.bat"
if l_0_0 == l_0_1 then
  return mp.INFECTED
else
  if (string.match)(l_0_0, l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN

