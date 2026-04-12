-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\29d7924a105a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "certutil", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "certify", 1, true) then
  return mp.CLEAN
end
do
  if not (string.find)(l_0_1, "ca-cert", 1, true) and not (string.find)(l_0_1, "cacertpath", 1, true) then
    local l_0_2 = (string.find)(l_0_1, "subject", 1, true)
  end
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certify_golden_cert_forge")
  return mp.INFECTED
end

