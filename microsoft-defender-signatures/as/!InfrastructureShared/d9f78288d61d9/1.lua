-- Threat: !InfrastructureShared
-- Name: d9f78288d61d9
-- Type: 21

if peattributes.no_security == true then
  return mp.CLEAN
end
if not peattributes.isdriver then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT >= 20 then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = {
  "AsrDrv",
  nil,
  "AsusGio",
  nil,
  "AsUpdateIo",
  nil,
  "GLCKIo",
  nil,
  "GDrv",
  nil,
  "GVCIDrv",
  nil,
  "MsIo",
  nil,
  "NTIOLib",
  nil,
  "Semav6msr",
  nil,
  "SegwinDrv",
  nil,
  "Atikia",
  nil,
  "Atillk",
  nil,
  "BSHWMIO",
  nil,
  "BSI2cIo",
  nil,
  "BSMEM",
  nil,
  "BSMI",
  nil,
  "WNBIOs",
  nil,
  "HwOs2EcDev",
  nil,
  "MTC0303",
  nil,
  "NchgBios",
  nil,
  "GenericDrv",
  nil,
  "BSFlash",
  nil,
  "NVFLASH",
  nil,
  "WinPhlash",
  nil,
  "PhyMem",
  nil,
  "PidDrv",
  nil,
  "PmxDrv",
  nil,
  "UCorew",
  nil,
  "WinFlash",
  nil,
  "Rtkio",
  nil,
  "SuperBmc",
  nil,
  "WinRing0",
  nil,
  "CEDBK",
  nil,
  "TmComm",
  nil,
  "DBUtil_2_3",
  nil,
  "RTCore64",
  nil,
  "EneIo",
  nil,
  "EneTechIo",
  nil,
  "DirectIO64",
  nil,
  "windiskaccess",
  nil,
  "asio2",
  nil,
  "winiob",
  nil,
  "Unlocker",
  nil,
  "EchoDrv",
  nil
}
local l_0_1 = mp.hstr_full_log()
for l_0_2, l_0_3 in pairs(l_0_1) do
  if l_0_3.matched and l_0_0[l_0_2] then
    mp.set_mpattribute("BM_ESRP:Hstr:" .. l_0_0[l_0_2])
    return mp.INFECTED
  end
end
return mp.INFECTED
