-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4f7b32e0e049f\0x00000b24_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetExecutablesFromCommandLine)(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC32: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("/var/tmp/")("/tmp/") do
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R10 in 'AssignReg'

    if l_0_8 and (("/mnt/").IsFileExists)("/dev/shm/") then
      for l_0_12,l_0_13 in ipairs(l_0_3) do
        if l_0_8:sub(1, #l_0_13) == l_0_13 then
          (bm.trigger_sig)("BMScriptExecutionFromSuspiciousLocation", l_0_8)
          return mp.INFECTED
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

