-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorPHPFollowWebshellB!webshell\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC39: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

local l_0_2 = (("/webapps/").get_contextdata)(("/apps/").CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

do
  local l_0_3 = (mp.GetProcessCommandLine)("/work/catalina/")
  if not l_0_3 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ipairs(l_0_1) do
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC70: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC71: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC72: Overwrote pending register: R12 in 'AssignReg'

    if (("/login/").find)("/www/", "/htdocs/", "/public/", true) and ((mp.get_mpattribute)("Lua:Linux:ProcName_wget") or (mp.get_mpattribute)("Lua:Linux:ProcName_curl")) and (string.find)(l_0_3, "-o ", 1, true) then
      return mp.INFECTED
    end
    if ((mp.get_mpattribute)("Lua:Linux:ProcName_bash") or (mp.get_mpattribute)("Lua:Linux:ProcName_sh")) and (string.find)(l_0_3, "-c ", 1, true) and ((string.find)(l_0_3, "echo ", 1, true) or (string.find)(l_0_3, "base64 -d ", 1, true)) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

