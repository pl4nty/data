-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b35b1ceefc\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  (bm.add_related_string)("Evidence", (this_sigattrlog[1]).utf8p2, bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[1]).utf8p2)
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC34: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R4 in 'AssignReg'

  if ("onedrivestandaloneupdater.exe")("OneDrive.exe", "gup.exe") then
    if l_0_0.Dll_Path then
      (bm.add_threat_file)(l_0_0.Dll_Path)
    end
    return mp.INFECTED
  end
end
do
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

