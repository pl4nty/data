-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b3c792c638\0x0000060d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = (string.gsub)(l_0_1, "\"", "")
  l_0_1 = (string.gsub)(l_0_1, "\'", "")
  local l_0_2 = (string.lower)(l_0_1)
  local l_0_3 = 0
  local l_0_4 = false
  if (string.find)(l_0_1, " %-[eE][ncodemaNCODEMA]*%s+") then
    local l_0_5 = NormalizeCmdline("powershell", l_0_1)
    if l_0_5 == nil then
      return mp.CLEAN
    end
    l_0_2 = (string.lower)(l_0_5)
    l_0_3 = l_0_3 + 1
    local l_0_6 = str_count_match
    local l_0_7 = l_0_2
    local l_0_8 = {}
    -- DECOMPILER ERROR at PC52: No list found for R8 , SetList fails

  end
  do
    -- DECOMPILER ERROR at PC57: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

    if isIEXfound(l_0_6) then
      local l_0_9 = str_count_match
      local l_0_10 = l_0_2
      do
        do
          local l_0_11 = {}
          -- DECOMPILER ERROR at PC66: Overwrote pending register: R9 in 'AssignReg'

          -- DECOMPILER ERROR at PC96: No list found for R7 , SetList fails

          -- DECOMPILER ERROR at PC98: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC99: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC102: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC103: Overwrote pending register: R9 in 'AssignReg'

          -- DECOMPILER ERROR at PC106: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC111: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC112: Overwrote pending register: R5 in 'AssignReg'

          if l_0_4 == true and l_0_3 >= 3 then
            return l_0_9
          else
            -- DECOMPILER ERROR at PC119: Overwrote pending register: R5 in 'AssignReg'

            -- DECOMPILER ERROR at PC120: Overwrote pending register: R5 in 'AssignReg'

            if l_0_4 == false and l_0_3 >= 2 then
              return l_0_9
            end
          end
          do return mp.CLEAN end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

