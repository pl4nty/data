-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ShortSeekE!dha\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0[8957006] = true
l_0_0[2262201400] = true
local l_0_1 = true
local l_0_2 = (sysio.GetLogicalDrivesMask)()
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC34: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("A:")("B:") do
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC43: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC44: Overwrote pending register: R12 in 'AssignReg'

    if (("F:").bitand)((("G:").shl32)("H:", "I:"), l_0_2) ~= 0 then
      local l_0_9 = (sysio.GetFileFsVolumeInformation)(l_0_8)
    end
  end
  if l_0_9 == nil or l_0_9.VolumeSerialNumber == nil or not l_0_0[l_0_9.VolumeSerialNumber] or l_0_1 then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

