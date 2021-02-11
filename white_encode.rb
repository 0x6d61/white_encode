class String
    def white_encode
        self.unpack('B*').first.split("").map{|i|i.gsub("0","\s").gsub("1","\t")}.join
    end

    def _eval
        eval([self.split("").map{|i|i.gsub("\s","0").gsub("\t","1")}.join].pack("B*"))
    end

end


if $0 == __FILE__
    print "def fibo(n); if n < 2 then return n else return fibo(n-2) + fibo(n - 1)end;end;puts fibo(10)".white_encode
else
    File.open($0,"r").read.scan(/[\t ]+/).first._eval
end