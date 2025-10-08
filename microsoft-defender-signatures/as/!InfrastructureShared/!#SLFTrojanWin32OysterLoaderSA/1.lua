-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32OysterLoaderSA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = {}
-- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R4 in 'AssignReg'

do
  if ("msteamssetup.exe")("zoominstallerfull.exe", "mssetup.exe") then
    local l_0_2 = (mp.GetCertificateInfo)()
    for l_0_6,l_0_7 in pairs(l_0_2) do
      if l_0_7.Signers == nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

