@your_coins = 500#手持ちのコイン

#ここからスロットマシーン
for i in 1..nil do
  puts "========================================"
  puts "コイン：#{@your_coins}枚"#現在のコイン枚数
  puts "何枚賭けますか？(辞める場合は「exit」と入力してください。)"
  @bet_coins = gets
  @bet_coins.chomp!#改行コード削除
  if (@bet_coins == "exit") then#プレイヤーが「exit」を入力した場合の処理
    break
  end
  @bet_coins_int = @bet_coins.to_i#StringクラスをNumericクラスに変換。もし、数字ではなく文字列が入力された場合は「0」となる。
  if (@your_coins < @bet_coins_int) then#プレイヤーが所持コイン以上の賭けを入力した時。
    puts "身の丈にあった賭けをしましょう。"
    next
  elsif (@bet_coins_int == 0) #0が入力された時の処理。文字列も「0」となっている。賭けコイン0枚か、指定していない入力をはじく。
    puts "対応していない入力です。やり直してください。"
    next
  end

  @array1 = [nil,nil,nil]#スロットの結果を格納するための配列を作成
  @array2 = [nil,nil,nil]
  @array3 = [nil,nil,nil]

  for i in -1..2 do#３回に分けてスロットの結果を出力する。
    if i == -1 then#1ループ目の処理。
      puts "========================================"
      puts "ゲームスタート！"
      puts "|#{@array1[0]}|#{@array1[1]}|#{@array1[2]}|"
      puts "|#{@array2[0]}|#{@array2[1]}|#{@array2[2]}|"
      puts "|#{@array3[0]}|#{@array3[1]}|#{@array3[2]}|"
      next
    end
    puts "========================================"
    puts "改行キーを押してください。"
    gets
    @array1[i] = rand(3)#1行目のスロット結果を生成
    case @array1[i]#表示を数字から記号にするコード
      when 0
        @array1[i] = "○"
      when 1
        @array1[i] = "×"
      when 2
        @array1[i] = "△"
    end
    @array2[i] = rand(3)#2行目のスロット結果を生成
    case @array2[i]
      when 0
        @array2[i] = "○"
      when 1
        @array2[i] = "×"
      when 2
        @array2[i] = "△"
    end
    @array3[i] = rand(3)#3行目のスロット結果を生成
    case @array3[i]
      when 0
        @array3[i] = "○"
      when 1
        @array3[i] = "×"
      when 2
        @array3[i] = "△"
    end
    puts "|#{@array1[0]}|#{@array1[1]}|#{@array1[2]}|"#スロット結果を出力
    puts "|#{@array2[0]}|#{@array2[1]}|#{@array2[2]}|"
    puts "|#{@array3[0]}|#{@array3[1]}|#{@array3[2]}|"
  end


  @check_lines = "".to_i#何行揃ったかを数えるための変数

  if (@array1[0] == @array1[1] && @array1[0] == @array1[2]) then#１行目が揃った時
    @check_lines = @check_lines + 1
    puts "１行目が揃いました。"
  end
  if (@array2[0] == @array2[1] && @array2[0] == @array2[2]) then#２行目が揃った時
    @check_lines = @check_lines + 1
    puts "２行目が揃いました。"
  end
  if (@array3[0] == @array3[1] && @array3[0] == @array3[2]) then#３行目が揃った時
    @check_lines = @check_lines + 1
    puts "３行目が揃いました。"
  end
  if (@array1[0] == @array2[0] && @array1[0] == @array3[0]) then#１列目が揃った時
    @check_lines = @check_lines + 1
    puts "１列目が揃いました。"
  end
  if (@array1[1] == @array2[1] && @array1[1] == @array3[1]) then#２列目が揃った時
    @check_lines = @check_lines + 1
    puts "２列目が揃いました。"
  end
  if (@array1[2] == @array2[2] && @array1[2] == @array3[2]) then#３列目が揃った時
    @check_lines = @check_lines + 1
    puts "３列目が揃いました。"
  end
  if (@array1[0] == @array2[1] && @array1[0] == @array3[2]) then#ななめが揃った時（左上から右下）
    @check_lines = @check_lines + 1
    puts "斜め(左上から右下)が揃いました。"
  end
  if (@array3[0] == @array2[1] && @array3[0] == @array1[2]) then#ななめが揃った時（左下から右上）
    @check_lines = @check_lines + 1
    puts "斜め(左下から右上)が揃いました。"
  end

  case @check_lines#何行揃ったかを出力。
    when 8 then
        puts "全部で8ライン揃いました。"
    when 7 then
        puts "全部で7ライン揃いました。"
    when 6 then
        puts "全部で6ライン揃いました。"
    when 5 then
        puts "全部で5ライン揃いました。"
    when 4 then
        puts "全部で4ライン揃いました。"
    when 3 then
        puts "全部で3ライン揃いました。"
    when 2 then
        puts "全部で2ライン揃いました。"
    when 1 then
        puts "全部で1ライン揃いました。"
    when 0 then
        puts "揃いませんでした。"
  end

  @add_coins = @bet_coins_int * @check_lines#獲得コイン。
  if (@add_coins != 0) then#獲得コインがあった際に、何枚獲得したかを表示。
    puts "コインを「#{@add_coins}枚」ゲットしました！"
  end

  @your_coins = @your_coins - @bet_coins_int + @add_coins#獲得コインを所持コインに加算

  if (@your_coins == 0)#スロットの結果、コインが無くなった際の処理
    puts "コインがなくなりました。"
    break
  end

end

puts "終了します。"