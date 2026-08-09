-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\67d7d919ae49\1.luac 

-- params : ...
-- function num : 0
if IsBasToolProcessForPpid("CMDHSTR", "AttackIQ") or IsBasToolProcessFoundInParents("CMDHSTR", "AttackIQ", 4) then
  local l_0_0 = (mp.GetParentProcInfo)()
  if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
    return mp.CLEAN
  end
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if not (string.find)(l_0_1, "powershell", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
  if isnull(l_0_2) or isnull(l_0_2.image_path) then
    return mp.CLEAN
  end
  local l_0_3 = (string.lower)(l_0_2.image_path)
  if not (string.find)(l_0_3, "python", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

