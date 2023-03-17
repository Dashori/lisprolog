#include <iostream>
#include <vector>

using namespace std;

vector<int> mainResult;

int dop(int n, vector<int> &holes, int i);

int isWin(int n, vector<int> holes)
{
    for (int i = 0; i < n - 1; i++)
        if (holes[i] != 0)
            return 0;

    return 1;
}

void printHols(int n, vector<int> holes)
{
    for (int i = 0; i < n - 1; i++)
        cout << holes[i] << " ";

    cout << "! " << holes[n - 1] << endl;
}

int shift(int n, vector<int> &holes, int k)
{
    k--;
    int result;
    if (holes[k] - (n - k) < 0)
        result = holes[k] + k;
    else
        result = (holes[k] - (n - k)) % n; 

    int need = holes[k];
    holes[k] = 0;

    for (int i = k + 1; (i < n) && (need > 0); i++)
    {
        holes[i]++;
        need--;
    }

    while (need > 0)
        for (int i = 0; (i < n) && (need > 0); i++)
        {
            holes[i]++;
            need--;
        }

    return result;
}

int mainSolve(int n, vector<int> &holes) 
{
    vector<int> newHoles = holes;

    for (int i = 0; i < n - 1; i++)
    {
        if (newHoles[i] != 0) // ищем первую не пустую лунку
        {
            int res = dop(n, newHoles, i);
            
            if (res)
            {
                newHoles = holes;
                continue;
            }
            else
            {
                mainResult.insert(mainResult.end(), i + 1);
                // cout << "Ход: " << i + 1 << ": ";
                // printHols(n, holes);
                return 0;
            }
        }
    }

    return 1;
}

int dop(int n, vector<int> &holes, int i)
{
    int resPos = shift(n, holes, i + 1);

    if (isWin(n, holes))
        return 0;

    if (resPos == n - 1)
    {
        int res = mainSolve(n, holes);

        if (!res)
            return 0;
    }
    else if (holes[resPos] == 1)
    {
        return 1;
    }
    else
    {
        int resDop = dop(n, holes, resPos);

        if (resDop == 0)
        {
            mainResult.insert(mainResult.end(), resPos + 1);
            // cout << "Ход " << resPos + 1 << ": ";
            // printHols(n, holes);
            return 0;
        }
    }

    return 1;
}

int main()
{
    cout << "Чука Рума - редчайшая разновидность однорядной манкалы для одного игрока.\n\n";
    cout << "Правила игры:\n\
Есть n маленьких лунок, расположенных слева направо. Справа от лунок есть большая лунка - Дом.\n\
В каждой из лунок есть k камней (семен). Для хода игрок берёт все камни из любой лунки и раскладывает их\n\
по одному в каждую лунку слева направо, по направлению к Дому, не пропуская ни одной.\n\
Цель игры состоит в том, чтобы перенести ВСЕ камни в Дом.\n\n\
При посеве:\n\
- если последний камень при посеве падает в пустую лунку, игра заканчивается, пасьянс не сошёлся;\n\
- если последний камень падает в непустую лунку, игрок берёт все камни из этой лунки и продолжает посев\n\
в том же направлении, начиная со следующей лунки;\n\
- если камень падает в Дом, и в руке остались камни, посев продолжается с первой лунки слева.\n\
- если посев заканчивается в Доме, игрок может начать новый посев камнями из любой маленькой лунки;\n\n";

    int n;
    cout << "Введите количество лунок: ";
    cin >> n;

    n++;

    vector<int> holes(n);
    vector<int> copyHoles(n);

    for (int i = 0; i < n - 1; i++)
    {
        cout << "Введите количество камней в " << i + 1 << " лунке: ";
        cin >> holes[i];
    }

    copyHoles = holes;

    cout << "\nНачальная позиция: ";

    printHols(n, holes);

    // cout << "\nРешение в обратном порядке:\n";

    mainSolve(n, holes);

    if (mainResult.size() == 0)
        cout << "Нет решения\n";

    for (int i = mainResult.size() - 1, j = 0; i >= 0; i--, j++)
    {
        cout << "Ход " << j + 1 << ", лунка " << mainResult[i] << ":    ";
        shift(n, copyHoles, mainResult[i]);
        printHols(n, copyHoles);
    }

    return 0;
}
