-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERHackToolPythonGoalPackA\1.luac 

-- params : ...
-- function num : 0
if (string.match)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)), "kali%-linux%-%d%d%d%d%.%d%d?%-installer.*%.iso") ~= nil then
  return mp.CLEAN
end
if #(mp.enum_mpattributesubstring)("SCPT:GoalPackD1") == 1 and #(mp.enum_mpattributesubstring)("SCPT:GoalPackA") >= 2 and #(mp.enum_mpattributesubstring)("SCPT:GoalPackB") > 3 then
  return mp.INFECTED
end
return mp.CLEAN

