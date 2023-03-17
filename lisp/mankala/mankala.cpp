#include <iostream>
#include <vector>

using namespace std;

int dop(int n, vector<int> &holes, int i);

// Вот он (по номерам лунок, откуда нужно делать каждый следующий ход): 3-4-2-3-4-1-4-2-3-4-Х.
int isWin(int n, vector<int> holes)
{
    for (int i = 0; i < n - 1; i++)
    {
        if (holes[i] != 0)
            return 0;
    }

    return 1;
}

void printHols(int n, vector<int> holes)
{
    for (int i = 0; i < n - 1; i++)
        cout << holes[i] << " ";

    cout << "! " << holes[n - 1] << endl;
}

// int checkLast(int n, vector<int> holes, k)
// {

// }


int shift(int n, vector<int> &holes, int k)
{
    // cout << n << " " << k << endl;
    k--;
    int result;
    if (holes[k] - (n - k) < 0)
        result = holes[k] + k;
    else
        result = (holes[k] - (n - k)) % n; 
    
    cout << "shift!\n";
  
    int need = holes[k];
    holes[k] = 0;

    for (int i = k + 1; (i < n) && (need > 0); i++)
    {
        holes[i]++;
        need--;
    }

    while (need > 0)
    {
        for (int i = 0; (i < n) && (need > 0); i++)
        {
            holes[i]++;
            need--;
        }
    }
    
    printHols(n, holes);
    
    return result;
}

int mainSolve(int n, vector<int> &holes) 
{
    vector<int> newHoles = holes;

    for (int i = 0; i < n - 1; i++)
    {
        if (newHoles[i] != 0) // choose first hole with stones
        {
            cout << "\n\nMAIN SOLVE " << i + 1 << endl;
            int res = dop(n, newHoles, i);
            
            if (res)
            {
                newHoles = holes;
                continue;
            }
        }
    }

    return 1;
}

int home(int n, vector<int> &holes) 
{
    vector<int> newHoles = holes;

    for (int i = 0; i < n - 1; i++)
    {
        if (newHoles[i] != 0) // choose first hole with stones
        {
            cout << "\n\nHOME " << i + 1 << endl;
            int res = dop(n, newHoles, i);
            
            if (res)
            {
                newHoles = holes;
                continue;
            }
        }
    }

    return 1;
}

int dop(int n, vector<int> &holes, int i)
{
    int resPos = shift(n, holes, i + 1);

    if (resPos == n - 1)
    {
        cout << "HOME\n";
        home(n, holes);
    }
    else if (holes[resPos] == 1)
    {
        cout << "YOU LOSE\n";
        return 1;
    }
    else
    {
        cout << "AGAIN\n";
        dop(n, holes, resPos);
    }

    if (isWin(n, holes))
    {
        cout << "Win\n";
        return 0;
    }
    else
    {
        cout << "Not win\n";
        return 1;
    }
    return 0;
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

    for (int i = 0; i < n - 1; i++)
    {
        cout << "Введите количество камней в " << i + 1 << " лунке: ";
        cin >> holes[i];
    }

    printHols(n, holes);

    mainSolve(n, holes);
    // shift(n, holes, 4);

    printHols(n, holes);


    // vector<int> newHoles = shift(n, holes);
    // printHols(n, newHoles);

    // if (isWin(n, holes))
    // {
    //     cout << "Win\n";
    //     return 0;
    // }

    // cout << "Not win\n";

    return 0;
}
