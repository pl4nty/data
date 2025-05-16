-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPEEopA\0x0000c473_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = (string.sub)(l_0_0, -4)
  if l_0_0:match("%->.+/") or l_0_0:match("%->.+\\") or l_0_0:match("%->.+%.cab%->") then
    return mp.CLEAN
  end
  if l_0_1 == ".exe" or l_0_1 == ".scr" or l_0_1 == ".com" then
    local l_0_2 = {}
    -- DECOMPILER ERROR at PC45: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

    local l_0_3 = "ALF:Trojan:Win32/"
    -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC48: Overwrote pending register: R5 in 'AssignReg'

    for l_0_7,l_0_8 in ("SLF:Trojan:Win32/")("Lowfi:HSTR:Win32/") do
      local l_0_9 = (mp.enum_mpattributesubstring)(l_0_8)
      if l_0_9 ~= nil and type(l_0_9) == "table" and l_0_3 >= 2 then
        return mp.INFECTED
      end
    end
    local l_0_10 = {}
    -- DECOMPILER ERROR at PC82: No list found for R4 , SetList fails

    -- DECOMPILER ERROR at PC83: Overwrote pending register: R5 in 'AssignReg'

    local l_0_11 = "TEL:Win32/"
    -- DECOMPILER ERROR at PC84: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC85: Overwrote pending register: R7 in 'AssignReg'

    for l_0_15,l_0_16 in ("TELPER:Trojan:Win32/")("HSTR:VirTool:Win32/") do
      -- DECOMPILER ERROR at PC88: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC90: Overwrote pending register: R12 in 'AssignReg'

      local l_0_17 = (("TEL:Trojan:Win32/").enum_mpattributesubstring)("HSTR:VirTool:Win32/Obfuscator")
      -- DECOMPILER ERROR at PC95: Overwrote pending register: R13 in 'AssignReg'

      if l_0_17 ~= nil and type("LoD:VirTool:Win32/Obfuscator") == "table" then
        if l_0_3 == 0 and l_0_11 >= 5 then
          return mp.INFECTED
        else
          if l_0_3 == 1 and l_0_11 >= 2 then
            return mp.INFECTED
          end
        end
      end
    end
    local l_0_18 = {}
    -- DECOMPILER ERROR at PC121: No list found for R6 , SetList fails

    -- DECOMPILER ERROR at PC122: Overwrote pending register: R7 in 'AssignReg'

    local l_0_19 = "HSTR:Win32/"
    -- DECOMPILER ERROR at PC123: Overwrote pending register: R8 in 'AssignReg'

    for l_0_23,l_0_24 in ("HSTR:Trojan:Win32/")(l_0_18) do
      -- DECOMPILER ERROR at PC129: Overwrote pending register: R14 in 'AssignReg'

      local l_0_25 = (mp.enum_mpattributesubstring)("AGGR:MSIL:GenPossibleCustomObfuscator.A")
      if l_0_25 ~= nil and type(l_0_25) == "table" then
        l_0_19 = l_0_19 + #l_0_25
        if l_0_3 == 1 and l_0_11 >= 2 and l_0_19 >= 4 then
          return mp.INFECTED
        else
          if l_0_11 >= 2 and l_0_19 >= 6 then
            return mp.INFECTED
          else
            if l_0_11 + (l_0_19) >= 4 then
              (mp.set_mpattribute)("Lua:PEEop.B")
            end
          end
        end
      end
    end
  end
end
do
  l_0_1 = mp
  l_0_1 = l_0_1.CLEAN
  return l_0_1
end

