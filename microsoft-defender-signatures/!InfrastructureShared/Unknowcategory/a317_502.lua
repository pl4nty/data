-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a317_502.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not (mp.get_mpattribute)("RPF:TopLevelFile") then
  return mp.CLEAN
end
if not l_0_0:find("impacket", 1, true) and not l_0_0:find("conficker", 1, true) and not l_0_0:find("\\salt", 1, true) and not l_0_0:find("metasploit", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

