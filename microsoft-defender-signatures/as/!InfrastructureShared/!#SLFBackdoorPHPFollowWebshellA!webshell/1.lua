-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorPHPFollowWebshellA!webshell\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC26: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("/var/www/html")("/webapps/root/") do
    -- DECOMPILER ERROR at PC31: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC33: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC34: Overwrote pending register: R9 in 'AssignReg'

    if (("/usr/share/nginx/html/").find)("/user_projects/domains/", "/standalone/deployments/", 1, true) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

