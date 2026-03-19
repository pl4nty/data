-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4fd7f3629837\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC33: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC35: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("-template ")("-upn ") do
  if not (string.find)(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM("CMDHSTR", "T1649", "certipy_esc1_cert_request")
return mp.INFECTED

