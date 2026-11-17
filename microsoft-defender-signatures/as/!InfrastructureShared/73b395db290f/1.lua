-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b395db290f\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[2]).utf8p1
if not l_0_0 or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (string.match)((string.lower)(l_0_1), "([^\\]+)$")
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3["httpd.exe"] = true
l_0_3["php-cgi.exe"] = true
l_0_3["php.exe"] = true
l_0_3["w3wp.exe"] = true
l_0_3["nginx.exe"] = true
do
  if StringStartsWith(l_0_2, "tomcat") then
    local l_0_4, l_0_5 = StringEndsWith(l_0_2, ".exe")
  end
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R4 in 'UnsetPending'

  if not l_0_3[l_0_2] and not l_0_4 then
    return mp.CLEAN
  end
  if (sysio.IsFileExists)(l_0_0) then
    (bm.add_related_file)(l_0_0)
  end
  TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence_Webshell")
  return mp.INFECTED
end

