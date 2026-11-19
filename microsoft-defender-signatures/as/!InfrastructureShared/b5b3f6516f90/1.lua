-- Threat: !InfrastructureShared
-- Name: b5b3f6516f90
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2
for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_3].matched and sigattr_head[l_0_3].attribute == 16401 and sigattr_head[l_0_3].utf8p1 ~= nil then
    l_0_0 = string.lower(sigattr_head[l_0_3].utf8p1)
    l_0_1 = string.lower(sigattr_head[l_0_3].utf8p2)
    l_0_2 = sigattr_head[l_0_3].ppid
    break
  end
end
if not l_0_2 then
  return mp.CLEAN
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if 1 <= #l_0_0 and string.sub(l_0_0, 1, 1) == "%" then
  return mp.CLEAN
end
if MpCommon.QueryPersistContextNoPath(l_0_2, "FilePersistContextToProcessRelay.B") == true then
  return mp.CLEAN
end
local l_0_4 = false
local l_0_5 = string.match(l_0_0, "([^\\]+)$")
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_1)
if l_0_6 == nil then
  return mp.CLEAN
end
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if string.sub(l_0_8, -#l_0_5) ~= l_0_5 and sysio.IsFileExists(l_0_8) then
    local l_0_9 = MpCommon.GetPersistContextCount(l_0_8)
    if 0 < l_0_9 and l_0_9 <= 100 then
      local l_0_10 = MpCommon.GetPersistContext(l_0_8)
      for l_0_11, l_0_12 in ipairs(l_0_10) do
        if 4 <= #l_0_12 and string.match(l_0_12, "^[tT][0-9][0-9][0-9][0-9]") then
          local l_0_13, l_0_14 = string.match(l_0_12, "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)")
          TrackPidAndTechniqueBM(l_0_2, l_0_13, l_0_14)
          l_0_4 = true
        end
      end
    end
  end
end
if l_0_4 == true then
  MpCommon.AppendPersistContextNoPath(l_0_2, "FilePersistContextToProcessRelay.B", 0)
  return mp.INFECTED
end
return mp.CLEAN
