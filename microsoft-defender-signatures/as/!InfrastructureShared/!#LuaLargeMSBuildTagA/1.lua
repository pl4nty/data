-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLargeMSBuildTagA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage)
local l_0_1 = {}
local l_0_2 = {}
local l_0_3 = {}
for l_0_9 in l_0_0:gmatch("<([^>]+)>") do
  local l_0_6, l_0_7 = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_2, l_0_3
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_2[l_1_0] then
    l_0_2[l_1_0] = true
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    l_0_3[#l_0_3 + 1] = l_1_0
  end
end
, function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_1
  for l_2_4 = #l_0_1, 1, -1 do
    if l_0_1[l_2_4] == l_2_0 then
      return true
    end
  end
  return false
end

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R9 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R9 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R9 in 'UnsetPending'

  while 1 do
    -- DECOMPILER ERROR at PC58: Unhandled construct in 'MakeBoolean' P1

    if (""):match("^%s*/") ~= nil and (""):match("^%s*/?%s*([%w_-]+)") and #l_0_1 > 0 and ((table.remove)(l_0_1) == (""):match("^%s*/?%s*([%w_-]+)")) then
      do break end
      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC59: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
  if not (""):match("^%s*!") ~= nil and (""):match("^%s*/?%s*([%w_-]+)") then
    local l_0_18 = nil
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC74: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC76: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC78: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC92: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC94: Confused about usage of register: R13 in 'UnsetPending'

    -- DECOMPILER ERROR at PC96: Confused about usage of register: R14 in 'UnsetPending'

    -- DECOMPILER ERROR at PC98: Confused about usage of register: R14 in 'UnsetPending'

    -- DECOMPILER ERROR at PC102: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC102: Unhandled construct in 'MakeBoolean' P3

    if l_0_1[#l_0_1] == "PropertyGroup" or ((l_0_1[#l_0_1] == "ParameterGroup" and l_0_1[#l_0_1 - 1] == "UsingTask") or l_0_1[#l_0_1] and l_0_1[#l_0_1] ~= "Project" and (l_0_1[#l_0_1 - 1] == "ItemGroup" or l_0_1[#l_0_1 - 1] == "ItemDefinitionGroup")) then
      l_0_6((""):match("^%s*/?%s*([%w_-]+)"))
    end
    if not l_0_17:match("/%s*$") and #l_0_1 < 256 then
      l_0_1[#l_0_1 + 1] = (""):match("^%s*/?%s*([%w_-]+)")
    end
  end
end
if #l_0_3 == 0 then
  return mp.CLEAN
end
do
  local l_0_19 = nil
  for l_0_23,l_0_24 in pairs(l_0_3) do
    local l_0_20, l_0_21 = , tostring(footerpage)
    -- DECOMPILER ERROR at PC131: Confused about usage of register: R11 in 'UnsetPending'

    -- DECOMPILER ERROR at PC141: Confused about usage of register: R11 in 'UnsetPending'

    if l_0_21:find("</" .. (""):match("^%s*!") ~= nil .. ">", 1, true) and not l_0_21:find("<" .. (""):match("^%s*!") ~= nil .. ">", 1, true) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC157: freeLocal<0 in 'ReleaseLocals'

  -- DECOMPILER ERROR: 10 unprocessed JMP targets
end

