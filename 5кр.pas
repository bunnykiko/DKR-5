uses crt, system;
var input: file of char;
    output: text;
    arr: array [1..10000] of char;
    start, start1, stop, stop1, n: integer;
    s: string;

function bubblesort: integer;
const n = 10;
var i, j: integer;
    a: char;
var k :integer; 
    m: array[1..n] of integer;
begin
  writeln('Введите массив: ');
  for i:= 1 to n do 
    begin
      writeln(i, 'элемент: '); 
      readln(m[i]);
    end;
  for i:= 1 to n-1 do 
    begin
      for j:= 1 to n-i do 
        begin
          if m[j]>m[j+1] then 
            begin
              k:= m[j];
              m[j]:= m[j+1];
              m[j+1]:= k;
            end;
        end;
      end;
  for i:= 1 to n do
  write(m[i], ' ');
end;

function bubblesortub: integer;
var i, j: integer;
    a: char;
begin
for i := 2 to n do
  begin
    a:= arr[i];
    j:=i-1;
    while (j>=1) and (arr[j]<a) do
      begin
        arr[j+1]:= arr[j];
        j:=j-1;
      end;
    arr[j+1]:= a;
  end;
end;

procedure fastsort(t, p: integer);
var i, j, k: integer; 
    arr1, y1: char;
begin
  i:= t;
  j:= p;
  k:= round((t+p)/2);
  arr1:= arr[k];
repeat
  while arr[i]<arr1 do inc(i);
  while arr[j]>arr1 do dec(j);
  if i <= j then
    begin
      y1:= arr[i];
      arr[i] := arr[j];
      arr[j] := y1;
      inc(i);
      dec(j);
    end;
until i>j;
  if t<j then 
    fastsort(t, j);
  if i<p then 
    fastsort(i, p);
end;

procedure fastsortub(first, last: integer);
var f, k: integer; 
    mid, count: char;
begin
  f:= first;
  k:= last;
  mid:= arr[(f+k) div 2];
repeat
  while arr[f]>mid do inc(f);
  while arr[k]<mid do dec(k);
  if f<=k then
    begin
      count:= arr[f];
      arr[f]:= arr[k];
      arr[k]:= count;
      inc(f);
      dec(k);
    end;
until f>k;
  if first<k then 
    fastsortub(first, k);
  if f<last then 
    fastsortub(f, last);
end;
begin
  assign(input, 'c:input.txt'); 
  assign(output, 'c:output.txt');
  rewrite(input); 
  rewrite(output);
  writeln('Введите длинну массива ');
  readln(n);
  writeln('Введите массив ');
for var i:= 1 to n do
begin
  readln(arr[i]);
  write(input, arr[i]);
end;
var st: integer;
  st:= 1;
  while st <> 0 do
    begin
      clrscr;
      writeln('Выберите сортировку');
      writeln('Сортировка пузырьковая - 1');
      writeln('Сортировка быстрым алгоритимом по возрастанию - 2');
      writeln('Сортировка вставкой по убыванию - 3');
      writeln('Сортировка быстрым алгоритимом по убыванию - 4');
      writeln('Выход из программы - 5');
      readln(st);
      start:= DateTime.Now.Second;
      start1:= DateTime.Now.MilliSecond;
case st of
  1: bubblesort;
  2: fastsort(1, n);
  3: bubblesortub;
  4: fastsortub(1, n);
  0: exit;
end;
for var i:= 1 to n do
      print(output, arr[i]);
      stop:= DateTime.Now.Second;
      stop1:= DateTime.Now.MilliSecond;
      close(output);
      reset(output);
      read(output, s);
      close(output);
      rewrite(output);
      write(s);
      writeln;
      writeln('Время выполнения: ', stop-start, 'секунд, ');
      writeln('Для окончания дважды нажмите enter ');
      readln;
      readln;
    end;
end.