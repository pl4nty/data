-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6ad_luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 30000000 then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = ((this_sigattrlog[1]).utf8p2):lower()
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_0 = ((this_sigattrlog[2]).utf8p2):lower()
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
      l_0_0 = ((this_sigattrlog[3]).utf8p2):lower()
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
        l_0_0 = ((this_sigattrlog[4]).utf8p2):lower()
      else
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
          l_0_0 = ((this_sigattrlog[5]).utf8p2):lower()
        else
          if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
            l_0_0 = ((this_sigattrlog[6]).utf8p2):lower()
          else
            if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
              l_0_0 = ((this_sigattrlog[7]).utf8p2):lower()
            else
              if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
                l_0_0 = ((this_sigattrlog[8]).utf8p2):lower()
              else
                return mp.CLEAN
              end
            end
          end
        end
      end
    end
  end
end
if #l_0_0 < 62 then
  return mp.CLEAN
end
l_0_0 = (string.gsub)(l_0_0, "\\1$", "")
local l_0_1 = #l_0_0 / 2
local l_0_2 = (string.sub)(l_0_0, -l_0_1)
local l_0_3, l_0_4 = (bm.get_process_relationships)()
for l_0_8,l_0_9 in ipairs(l_0_4) do
  local l_0_10 = (mp.bitand)(l_0_9.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_10 == bm.RELATIONSHIP_CREATED then
    local l_0_11 = (string.lower)(l_0_9.cmd_line)
    if (string.find)(l_0_11, "http", 1, true) or (string.find)(l_0_11, "scrobj.dll", 1, true) or (string.find)(l_0_11, "fileprotocolhandler", 1, true) or (string.find)(l_0_11, ".sct", 1, true) or (string.find)(l_0_11, ".savetofile", 1, true) or (string.find)(l_0_11, ".responsebody", 1, true) then
      local l_0_12 = (string.sub)(l_0_11, -l_0_1)
      if l_0_2 == l_0_12 then
        (bm.trigger_sig)("StartedViaRUNMRU", "StartedViaRUNMRU", l_0_9.ppid)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN

