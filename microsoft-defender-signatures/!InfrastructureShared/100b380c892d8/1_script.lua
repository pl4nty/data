-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\100b380c892d8\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p1)
  if l_0_0 ~= "" then
    (bm.add_related_file)(l_0_0)
  end
end
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[5]).utf8p1)
  if l_0_1 ~= "" then
    (bm.add_related_file)(l_0_1)
  end
end
local l_0_2 = (bm.get_current_process_startup_info)()
if l_0_2 ~= nil and l_0_2.ppid ~= nil then
  (bm.request_SMS)(l_0_2.ppid, "M")
  ;
  (bm.add_action)("SmsAsyncScanEvent", 3000)
  return mp.INFECTED
end
return mp.CLEAN

