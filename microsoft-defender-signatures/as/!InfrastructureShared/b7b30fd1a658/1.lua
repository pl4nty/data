-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b7b30fd1a658\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
    local l_0_0 = (this_sigattrlog[4]).utf8p2
    if (string.find)(l_0_0, "^/Users/[^/]+/Desktop/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Documents/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Downloads/[^/]+$", 1, false) or (string.find)(l_0_0, "^/private/tmp/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Desktop/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Documents/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_0, "^/Users/[^/]+/Downloads/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_0, "^/private/tmp/[^/]+/[^/]+$", 1, false) then
      if (sysio.IsFileExists)(l_0_0) then
        (bm.add_threat_file)(l_0_0)
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

