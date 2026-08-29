-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanNPMJSExecSC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if l_0_1 == nil or l_0_1 < 100 or l_0_1 > 524288 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2 = (mp.readfile)(0, l_0_1)
;
(mp.readprotection)(true)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = tostring(l_0_2)
local l_0_3 = 0
for l_0_7 in (string.gmatch)(l_0_2, "\\U%x%x%x%x%x%x%x%x") do
  l_0_3 = l_0_3 + 1
  if l_0_3 >= 64 then
    break
  end
end
do
  local l_0_8 = 0
  if l_0_3 < 8 then
    for l_0_12 in (string.gmatch)(l_0_2, "\\u%x%x%x%x") do
      l_0_8 = l_0_8 + 1
      if l_0_8 >= 128 then
        break
      end
    end
  end
  do
    if l_0_3 < 8 and l_0_8 < 16 then
      return mp.CLEAN
    end
    local l_0_13 = (string.lower)(l_0_2)
    local l_0_14 = {}
    -- DECOMPILER ERROR at PC96: No list found for R6 , SetList fails

    -- DECOMPILER ERROR at PC97: Overwrote pending register: R7 in 'AssignReg'

    local l_0_15 = "__subclasses__"
    -- DECOMPILER ERROR at PC98: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC99: Overwrote pending register: R9 in 'AssignReg'

    for l_0_19,l_0_20 in ("__class__.__base__")("__class__.__bases__") do
      if (string.find)(l_0_13, l_0_20, 1, true) then
        break
      end
    end
    do
      if l_0_15 == nil then
        return mp.CLEAN
      end
      local l_0_21 = {}
      for l_0_25 in (string.gmatch)(l_0_2, "\\U(%x%x%x%x%x%x%x%x)") do
        local l_0_26 = tonumber(l_0_25, 16)
        if l_0_26 and l_0_26 < 128 then
          local l_0_27 = #l_0_21 + 1
        else
        end
      end
      for l_0_31 in (string.gmatch)(l_0_2, "\\u(%x%x%x%x)") do
        local l_0_32 = tonumber(l_0_31, 16)
        if l_0_32 and l_0_32 < 128 then
          local l_0_33 = #l_0_21 + 1
        else
        end
      end
      local l_0_34 = (string.lower)((table.concat)(l_0_21))
      if #l_0_34 < 8 then
        return mp.CLEAN
      end
      local l_0_35 = {}
      -- DECOMPILER ERROR at PC200: No list found for R10 , SetList fails

      do
        local l_0_36 = {}
        -- DECOMPILER ERROR at PC202: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC203: Overwrote pending register: R13 in 'AssignReg'

        for l_0_40,l_0_41 in ("__import__")("__builtins__") do
          -- DECOMPILER ERROR at PC206: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC208: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC209: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC210: Overwrote pending register: R20 in 'AssignReg'

        end
        if not (("subprocess").find)("popen", ".system", "eval", true) or #l_0_36 < 2 then
          return mp.CLEAN
        end
        do return mp.INFECTED end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

