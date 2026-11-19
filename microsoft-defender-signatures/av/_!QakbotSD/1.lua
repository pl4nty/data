-- Threat: \xac!Qakbot.SD
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_LNK_FILE

local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.BasePath and contains(l_0_0.BasePath, "cmd.exe") then
  local l_0_1 = l_0_0.Arguments or nil
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = l_0_1:gsub("&&", "")
  if 3 < l_0_3 and contains(l_0_1, "curl%.?e?x?e?%s+.*https?.*wscript%.?e?x?e?", false) then
    return mp.INFECTED
  end
end
return mp.CLEAN
