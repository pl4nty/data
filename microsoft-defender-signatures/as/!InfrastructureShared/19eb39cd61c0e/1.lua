-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19eb39cd61c0e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[9]
if l_0_0 == nil or l_0_0.matched ~= true or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if (string.find)(l_0_1, ".monster/?", 1, true) or (string.find)(l_0_1, ".top/?", 1, true) or (string.find)(l_0_1, ".pro/?", 1, true) or (string.find)(l_0_1, "?subid=", 1, true) or (string.find)(l_0_1, "?__cf_chl_tk=", 1, true) then
  return mp.INFECTED
end
local l_0_2 = (bm.get_current_process_startup_info)()
if l_0_2 == nil or l_0_2.command_line == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.command_line)
local l_0_4, l_0_5 = (string.gsub)(l_0_3, "%^", "")
if l_0_5 >= 16 then
  return mp.INFECTED
end
local l_0_6 = 0
if (string.find)(l_0_3, "\\powershell.exe", 1, true) or (string.find)(l_0_3, "\\pwsh.exe", 1, true) then
  local l_0_7 = str_count_match
  local l_0_8 = l_0_3
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC120: No list found for R9 , SetList fails

end
do
  -- DECOMPILER ERROR at PC123: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R10 in 'AssignReg'

  if (l_0_7.find)(l_0_3, "\\cmd.exe", "iex%(", true) then
    local l_0_10 = str_count_match
    local l_0_11 = l_0_3
    local l_0_12 = {}
    -- DECOMPILER ERROR at PC137: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC138: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC139: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC140: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC141: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC142: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC143: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC144: No list found for R9 , SetList fails

    -- DECOMPILER ERROR at PC146: Overwrote pending register: R6 in 'AssignReg'

  end
  do
    -- DECOMPILER ERROR at PC147: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC151: Overwrote pending register: R10 in 'AssignReg'

    if (l_0_10.find)(l_0_3, "\\conhost.exe", "http", true) then
      local l_0_13 = str_count_match
      local l_0_14 = l_0_3
      local l_0_15 = {}
      -- DECOMPILER ERROR at PC161: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC162: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC163: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC164: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC165: Overwrote pending register: R16 in 'AssignReg'

      -- DECOMPILER ERROR at PC166: Overwrote pending register: R17 in 'AssignReg'

      -- DECOMPILER ERROR at PC167: No list found for R9 , SetList fails

      -- DECOMPILER ERROR at PC169: Overwrote pending register: R6 in 'AssignReg'

    end
    do
      -- DECOMPILER ERROR at PC170: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC174: Overwrote pending register: R10 in 'AssignReg'

      if (l_0_13.find)(l_0_3, "\\msiexec.exe", " %-%-headless ", true) then
        local l_0_16 = str_count_match
        local l_0_17 = l_0_3
        local l_0_18 = {}
        -- DECOMPILER ERROR at PC184: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC185: No list found for R9 , SetList fails

        -- DECOMPILER ERROR at PC187: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC188: Overwrote pending register: R6 in 'AssignReg'

      end
      do
        do
          -- DECOMPILER ERROR at PC191: Overwrote pending register: R7 in 'AssignReg'

          if l_0_6 >= 3 then
            return l_0_16.INFECTED
          end
          do return mp.CLEAN end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

